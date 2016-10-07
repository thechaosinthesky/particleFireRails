ParticleFire.Models.Profile = Backbone.Model.extend({

  defaults: {
    name: ''
  },

  validation: {
    name: {
      required: true,
      msg: 'Please enter a profile name'
    }
  },

  url: function() {
    var base = 'users/' + ParticleFire.App.user.id +  '/profiles';
    if(this.id){
      base += '/' + this.id;
    }
    return base;
  },

  initialize: function() {

  }
});

ParticleFire.Collections.Profile = Backbone.Collection.extend({
  model: ParticleFire.Models.Profile,
  url: function() {
    return 'users/' + ParticleFire.App.user.id +  '/profiles';
  },
  initialize: function() {

  }
});