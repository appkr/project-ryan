var FollowButton = React.createClass({
  getInitialState: function() {
    return { is_follow: this.props.is_follow };
  },

  onClickFollowButton: function() {
    console.log("onClick Follow Button is Called");
    if (!this.state.is_follow) {
      $.ajax({
        method: 'POST',
        url: "/follows?user_id=" + this.props.user.id,
        dataType: 'JSON',
        success: function(data) {
          console.log('success');
          this.setState({ is_follow: true });
          this.props.on_follow_listener(true);
        }.bind(this)
      });
    }
    else {
     $.ajax({
        method: 'DELETE',
        url: "/follows/" + this.props.user.id,
        dataType: 'JSON',
        success: function(data) {
          console.log('success');
          this.setState({ is_follow: false });
          this.props.on_follow_listener(false);
        }.bind(this)
      }); 
    }
  },

  /* ************************************************************************ */

  render: function() {
    if ( !this.props.is_owner )
      return (
        <button onClick={this.onClickFollowButton}>
          {this.state.is_follow ? "언팔로우하기" : "팔로우하기"}
        </button>
      );
    else
      return (<div></div>)
  }
});

/* ************************************************************************ */
/* ************************************************************************ */

var Profile = React.createClass({
  propTypes: {
    user: React.PropTypes.object,
    scope: React.PropTypes.object
  },

  getInitialState: function() {
    return { followed_cont: this.props.scope.followed_cont };
  },

  componentDidMount: function() {
    console.log("Init Profile Component");
  },

  onHandleFollow: function(is_follow) {
    console.log("on Handle Follow");
    if (is_follow)
      followed_cont = this.state.followed_cont + 1
    else
      followed_cont = this.state.followed_cont - 1

    this.setState({ followed_cont: followed_cont });
  },

  /* ************************************************************************ */

  render: function() {
    $props = this.props.scope;
    $state = this.state;

    var followingUsers = $props.following_users.map(function(user) {
      return (
        <div>email : {user.email} , name : {user.name}</div>
      );
    });

    var divStyle = {
      marginTop: '20px'
    };

    return (
      <div>
        <div> Name: {this.props.user.name}</div>
        <div>Email: {this.props.user.email}</div>
        <div>isOwner: {$props.isOwner ? "true" : "false"}</div>
        <div>팔로잉수 : {$props.following_count}</div>
        <div>팔로워수 : {$state.followed_cont}</div>
        <FollowButton is_follow={$props.is_follow} is_owner={$props.isOwner} user={this.props.user} on_follow_listener={this.onHandleFollow}/>
        <div style={divStyle}>팔로잉 사용자 목록</div>
        <div> {followingUsers} </div>
      </div>
    );
  }
});
