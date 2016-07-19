var Rending = React.createClass({
  propTypes: {
    following_users: React.PropTypes.Array
  },

/* ************************************************************************ */


/* ************************************************************************ */
  render: function() {
    
    var test = this.props.following_users.count;
	var followingUsers = this.props.following_users.map(function(user) {
      return (
        <div>
          email : {user.email} , name : {user.name}
        </div>
      );
    });

	return (
		<div>
			<h1>Hello. This is rending Page :)</h1>

    		<div>너가 팔로우 하고 있는 유저들 !</div>
    		<div>{followingUsers}</div>
		</div>
    );
  }
});