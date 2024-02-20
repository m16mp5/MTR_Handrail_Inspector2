$(function() {
    $('input[name="dateRange"]').daterangepicker({
      "showDropdowns": true,
      "linkedCalendars": false,
      "startDate": "01/01/2021",
      "minDate": "2021-01-01",
      "maxDate": "2025-12-31",
      autoApply: true,
      opens: 'right',
      "locale": {
        "format": "YYYY-MM-DD",
        "separator": " to ",
        "fromLabel": "From",
        "toLabel": "To",
        "customRangeLabel": "Custom",
        "firstDay": 1,
      },
    }, function(start, end, label) {
      console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
    });
  });