# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  $('#lectores tr').click ->
    $(this).toggleClass('row_selected') 
    if $(this).hasClass('row_selected')
      $(this).find('input:checkbox').attr('checked',true)
    else
      $(this).find('input:checkbox').attr('checked', false)
 
  $("#lectores").dataTable 
    'sDom': "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>", 
    'sPaginationType': 'bootstrap',
    'oLanguage': dataTablesES
  $.datepicker.setDefaults( $.datepicker.regional[ 'es' ] )
  $('#lector_fecha_nacimiento').datepicker
    dateFormat: 'yy-mm-dd'
    changeMonth: true
    changeYear: true

