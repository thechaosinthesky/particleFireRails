ParticleFire.Models.IO = Backbone.Model.extend({

	io_types:[
		{
      "name":"toggle", 
      "label":"Toggle Switch",
      "settings": {
        "requirePin":true, 
        "onAction":"triggerPulse", 
        "offAction":"triggerPulse", 
        "statusFunction":"digitalRead",
        "actionPin":"D0",  
        "statusPin":"D1",
        "onLabel":"ON",
        "offLabel":"OFF"
      },
      "settingsValidation": {
        'settings.onAction': {
          required: true,
          msg: 'Please enter the device action.'
        },
        'settings.offAction': {
          required: true,
          msg: 'Please enter the device action.'
        },
        'settings.statusFunction': {
          required: true,
          msg: 'Please enter the device status function.'
        },
        'settings.actionPin': {
          required: true,
          msg: 'Please enter the device pin to perform the action on.'
        },
        'settings.statusPin': {
          required: true,
          msg: 'Please enter the device pin to to read the status from.'
        },
        'settings.onLabel': {
          required: true,
          msg: 'Please enter the display label for \'on\' status.'
        },
        'settings.offLabel': {
          required: true,
          msg: 'Please enter the display label for \'off\' status.'
        }
      }
    },
    {
      "name":"status", 
      "label":"Status",
      "settings": {
        "statusFunction":"digitalRead",
        "statusPin":"D1",
        "onLabel":"ON",
        "offLabel":"OFF"
      },
      "settingsValidation": {
        'settings.statusFunction': {
          required: true,
          msg: 'Please enter the device status function.'
        },
        'settings.statusPin': {
          required: true,
          msg: 'Please enter the device pin to to read the status from.'
        },
        'settings.onLabel': {
          required: true,
          msg: 'Please enter the display label for \'on\' status.'
        },
        'settings.offLabel': {
          required: true,
          msg: 'Please enter the display label for \'off\' status.'
        }
      }
    }
		// {"value":"power_buttons", "label":"Power Buttons"},
		// {"value":"analog_output", "label":"Measurement"}
		// {"value":"video", "label":"Video Feed"}
	],

  defaults: {
    name: '',
    io_type: null,
    device_id: '',
    settings: {}
  },

  validation: {
    name: {
      required: true,
      msg: 'Please enter a name.'
    },
    io_type: {
      required: true,
      msg: 'Please select an IO type.'
    },
    device_id: {
      required: true,
      msg: 'Please select a device.'
    }
  },

  url: function() {
    var base = '/ios';
    if(!this.id){
      base = '/profiles/' + this.profile_id + '/ios'
    }
    else{
      base += '/' + this.id;
    }
    return base;
  },

  initialize: function(options) {
    this.profile_id = options.profile_id;
  },

  triggerAction: function(obj) {
    if(!obj){
      obj = this.get('settings');
    }
    $.ajax({
      url: "/ios/" + this.id,
      method: "POST",
      data: obj
    });
  },

  loadStatus: function(callback) {
    var that = this;
    var settings = this.get('settings');

    $.ajax({
      url: "/ios/" + this.id + "/status",
      method: "GET",
      data: {"statusFunction": settings["statusFunction"], "statusPin": settings["statusPin"]},
      success: function(res){
        that.set({state:res.io_status}, {silent:true});
        callback();
      },
      error: function(){
        var error = "Error reading the IO Status.";
        $.growl.error({message: error});
      }
    });
  }
});

ParticleFire.Collections.IO = Backbone.Collection.extend({
  model: ParticleFire.Models.IO,
  url: function() {
    return '/profiles/' + this.profile_id + '/ios'
  },
  initialize: function(array, options) {
  	this.profile_id = options.profile_id;
  }
});