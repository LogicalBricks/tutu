Tutu.ListLibrosView = Ember.View.extend({
  templateName:    'tutu/templates/libros/list',
  librosBinding: 'Tutu.librosController',
  refreshListing: function(){
    Tutu.librosController.findAll();
  }
});
