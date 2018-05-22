class @Job
  constructor: (@data) ->

  isValid: ->
    @data.hasOwnProperty("finished")

  render: ->
    if @isValid()
      Templates.job
        name: @data.name
        started_at: @data.started_at
        finished_at: @data.finished_at
        status: @data.status
        class: @data.status.toLowerCase()
