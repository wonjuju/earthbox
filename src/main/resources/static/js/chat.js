log.addEventListener("scroll", (event) => {

	
	if (event.target.scrollHeight - event.target.scrollTop === event.target.clientHeight) {
		log.isScrollBottom = true;
	} else {
		log.isScrollBottom = false;
	}
});


const addLog = () => {

	if (log.isScrollBottom) {
		log.scrollTop = log.scrollHeight;
	}
};