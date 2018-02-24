//[Data Table Javascript]

//Project:	Apro Admin - Responsive Admin Template
//Version:	1.1
//Last change:  10/10/2017
//Primary use:   Used only for the Data Table

$(function () {
    "use strict";

    $('#example1').DataTable();
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    });
	
	
	$('#example').DataTable( {
		dom: 'Bfrtip',
		buttons: [
			'csv', 'excel'
		]
	} );

    $('#pagosdeingreso').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'csv', 'excel','pdf'
        ]
    });
    $('.tablaexcel').DataTable({
        'paging': true,
        'lengthChange': true,
        'searching': true,
        'ordering': true,
        'info': true,
        'autoWidth': false,
        dom: 'Bfrtip',
        buttons: [
            'excel'
        ]
    });
    $('#pagosdeegreso').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'csv', 'excel', 'pdf'
        ]
    });
  }); // End of use strict