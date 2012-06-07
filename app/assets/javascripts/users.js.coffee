# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
    $('#bilgi').dataTable({
    "aoColumnDefs": [
      { "bSortable": false, "aTargets": [ 0 ] }
    ]
    "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>"
    })

$.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
} );

$("#tabs").tabs();

$('.datepicker').datepicker()

$('.typeahead').typeahead()
