@EmailForm = React.createClass
  getInitialState: ->
    subject: @props.subject
    body: @props.body
    content_type: ''
    from: @props.from
    to: @props.to
    tab: 'html'

  handleInputChange: (field, event) ->
    state        = @state
    state[field] = event.target.value
    @setState(state)
    true

  handleSubmit: (event) ->
    event.preventDefault()

    $.ajax
      type: 'POST'
      url: '/emails'
      data: @state
      success: (response) ->
        console.log response
      error: =>
        true
    false

  handleTypeChange: (event) ->
    @setState content_type: event.target.value
    true

  render: ->
    `<form onSubmit={this.handleSubmit}>
      <div className="form-group">
        <label>To</label>
        <input
          type="text"
          value={this.state.to}
          onChange={this.handleInputChange.bind(this, 'to')}
          className="form-control" />
      </div>
      <div className="form-group">
        <label>From</label>
        <input
          type="text"
          value={this.state.from}
          onChange={this.handleInputChange.bind(this, 'from')}
          className="form-control" />
      </div>
      <div className="form-group">
        <label>Subject</label>
        <input
          type="text"
          value={this.state.subject}
          onChange={this.handleInputChange.bind(this, 'subject')}
          className="form-control" />
      </div>
      <div className="form-group">
        <label>Body</label>
        <textarea
          value={this.state.body}
          className="form-control"
          onChange={this.handleInputChange.bind(this, 'body')}
          rows={20} />
      </div>
      <div className="form-group">
        <label className="radio-inline">
          <input
            type="radio"
            value=""
            checked={this.state.content_type == ''}
            onChange={this.handleTypeChange} /> Both
        </label>
        <label className="radio-inline">
          <input
            type="radio"
            value="text/html"
            checked={this.state.content_type == 'text/html'}
            onChange={this.handleTypeChange} /> HTML Only
        </label>
        <label className="radio-inline">
          <input
            type="radio"
            value="text/plain"
            checked={this.state.content_type == 'text/plain'}
            onChange={this.handleTypeChange} /> Text Only
        </label>
      </div>
      <div className="form-group">
        <button
          type="submit"
          className="btn btn-primary btn-lg">
          Submit
        </button>
      </div>
    </form>`
