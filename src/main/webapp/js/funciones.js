	function deSelectSexo() {
	
		var radio = document.querySelector('input[type=radio]:checked');

		radio.checked = false;
		
	}

	function selectAficiones() {

		var items = document.querySelectorAll('input[type=checkbox]');

			for (var i = 0; i < items.length; i++) {

			items[i].checked = true;

		}
		
	}

	function deSelectAficiones() {

		var items = document.querySelectorAll('input[type=checkbox]');

		for (var i = 0; i < items.length; i++) {

			items[i].checked = false;

		}
	}


	function deSelectMusica() {
		
		var ele = document.getElementsByTagName("musicas");

		for (var i = 0; i < ele.length; i++) {

			if (ele[i].type == "select") {

				ele[i].selected = false;

			}

		}
	}
	
	function selectMusica() {
		
		var ele = document.getElementsByTagName("musicas");

		for (var i = 0; i < ele.length; i++) {

			if (ele[i].type == "select") {

				ele[i].selected = true;

			}

		}
	}
	
	function limpiar() {

	deSelectSexo();
	deSelectAficiones();
	deSelectMusicas();

	}
