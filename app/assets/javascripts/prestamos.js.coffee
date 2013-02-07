$ ->
  $("#prestamos").dataTable 
    'sDom': "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>", 
    'sPaginationType': 'bootstrap',
    'oLanguage': dataTablesES
  $('#prestamo_fecha_prestamo').datepicker
    dateFormat: 'yy-mm-dd'
    changeMonth: true
    changeYear: true
  $('#prestamo_fecha_entrega').datepicker
    dateFormat: 'yy-mm-dd'
    changeMonth: true
    changeYear: true

