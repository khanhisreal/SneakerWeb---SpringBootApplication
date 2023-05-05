function disapprove(row) {
  // Display confirmation dialog to the user
  var result = window.confirm("Do you want to disapprove the order?");

  if (result) {
    // Change the HTML of the row to indicate disapproval
    row.classList.add("inactive");
    var tds = row.getElementsByTagName("td");
    for (var i = 0; i < tds.length - 1; i++) { // loop through all but the last td element
      if(tds.length - 1) {
        continue;
      }
      tds[i].classList.add("inactive");
    }
    tds[tds.length - 2].setAttribute("colspan", "2"); // reset the colspan to 2 for the second-to-last td element
    tds[tds.length - 2].setAttribute("style", "text-align: center; color: red;");
    tds[tds.length - 2].textContent = "Order disapproved";
    row.removeChild(tds[tds.length - 1]); // remove the last td element (which contains the "Disapprove" button)
  } else {
    // Do nothing
    return;
  }
}
