@RadialProgress = React.createClass
  propTypes:
    progress: React.PropTypes.node,
  getInitialState: -> { progress: this.props.progress }
  start: ->
    f = => this.setState progress: if this.state.progress > 95 then 100 else this.state.progress + 1
    setInterval(f, 100)
  render: ->
    if @state.progress
      percentText = "#{Math.ceil(@state.progress)}"
      percentText+= '%' unless @state.progress > 99
      dashValue = "#{(@state.progress / 100) * 251},999"
      if (@state.progress > 50) then fontSize = (@state.progress + 10) / 4 else fontSize = 15
      display = `<g>
        <circle cx="50" cy="50" r="40" fill="none" strokeWidth="11" stroke="#EEEEEE"></circle>
        <circle cx="50" cy="50" r="40" fill="none" strokeWidth="10" stroke="#CC0000" strokeDasharray={dashValue} fill="#CC0000" fillOpacity={this.state.progress == 100 ? 1 : 0}></circle>
        <text x={57-fontSize} y={47+fontSize/2} textAnchor="left" fontSize={fontSize} fill={this.state.progress == 100 ? '#FFFFFF' : '#000000'}>{percentText}</text>
      </g>`
    else
      display = `<g>
        <path transform="translate(5.5,5.5) scale(11.2)" d="M4 0c-2.2 0-4 1.8-4 4s1.8 4 4 4c1.1 0 2.12-.43 2.84-1.16l-.72-.72c-.54.54-1.29.88-2.13.88-1.66 0-3-1.34-3-3s1.34-3 3-3c.83 0 1.55.36 2.09.91l-1.09 1.09h3v-3l-1.19 1.19c-.72-.72-1.71-1.19-2.81-1.19z" fill="#EEEEEE" />
        <text x="60" y="60" textAnchor="middle" fontSize="15" fill="#CCCCCC">Working...</text>
      </g>`
    `<svg viewBox="0 0 100 100" style={{minWidth: "64px", minHeight: "64px", margin: "0 auto"}} onClick={this.start}>{display}</svg>`
