//= require jquery

$(document).ready(function() {
  $('#publication_type').on('change', function() {
    var t = document.getElementById('publication_type');
	if(t.selectedIndex==1){
	show_content();
	}else{
		if(t.selectedIndex>1){
			show_url();}
		else{
			document.getElementById('url').style.display='none';
    		document.getElementById('content').style.display='none';
		}
	}
  });
});

function show_content() {
    document.getElementById('url').style.display='none';
    document.getElementById('content').style.display='block';
}

function show_url() {
    document.getElementById('content').style.display='none';
    document.getElementById('url').style.display='block';
}