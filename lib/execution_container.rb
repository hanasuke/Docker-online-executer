require 'docker-api'

class ExecutionContainer
  def initialize(time, lang)
    @lang = lang
    @time = time

    @container = Docker::Container.create(
      name: "#{time}-exec-container",
      Image: 'wsp',
      HostConfig: {
        Binds: [
          "#{File.expand_path('tmp')}:/tmp"
        ]
      },
      Workdir: '/tmp',
      Tty: true
    )
  end

  def exec()
    compile_cmd = ''
    case @lang
    when 'c' then
      compile_cmd = "gcc -o #{@time}"
    end
    @container.start
    r = @container.exec(['bash','-c', "cd /tmp && #{compile_cmd} #{@time}.#{@lang} && ./#{@time} < #{@time}.in"])
    @container.stop
    @container.delete(force: true)
    return r
  end
end
