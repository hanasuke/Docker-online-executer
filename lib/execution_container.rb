require 'docker-api'

class ExecutionContainer
  def initialize()
    @c = Docker::Container.create(
      Image: 'wing-env',
      Tty: true
    )
    p @c
  end

  def exec()
    @c.start
    r = @c.exec(['bash','-c','ls -l'])
    @c.stop
    @c.delete(force: true)
    return r
  end
end
