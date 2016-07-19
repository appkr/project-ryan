var Profile = React.createClass({
  propTypes: {
    name: React.PropTypes.string,
    email: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>Name: {this.props.name}</div>
        <div>Email: {this.props.email}</div>
      </div>
    );
  }
});
