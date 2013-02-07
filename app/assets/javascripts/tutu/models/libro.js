Tutu.Libro = Ember.Resource.extend({
  resourceUrl: '/libros',

  nombreLibro: Ember.computed(function(){
    return this.get('titulo') + ' ' + this.get('autor');
    }).property('titulo', 'autor')
});
