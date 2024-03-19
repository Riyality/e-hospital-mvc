function loadTable(pageNo, numberOfElements) {

	$('#tableID').DataTable(
		{
			drawCallback: function() {
				if (numberOfElements <= 0) {
					$('.paginate_button.next.disabled',
						this.api().table().container()).on(
							'click', function() {
								$('.paginate_button.next.disabled').attr("disabled");
							});
				}
				else {
					$('.paginate_button.next.disabled',
						this.api().table().container()).on(
							'click', function() {
								$('.paginate_button.next.disabled').attr('href', '?pageNo=' + (pageNo + 1));
							});
				}
				$('.paginate_button.previous.disabled',
					this.api().table().container()).on(
						'click', function() {
							if (pageNo != 0) {
								$('.paginate_button.previous.disabled').attr('href', '?pageNo=' + (pageNo - 1));
							}
					});
			},
			scrollY: '70vh',
			scrollCollapse: true,
			"scrollX": true,
			"bSort": true,
			"bPaginate": true,
			"autoWidth": false,
			"ordering": false,
			dom: '<"top"i>rt<"bottom"flp><"clear">'
			
		});
	$(".dataTables_scroll , .dataTables_scrollHead, .dataTables_scrollHeadInner,  #tableID").css("width", "100%");
}