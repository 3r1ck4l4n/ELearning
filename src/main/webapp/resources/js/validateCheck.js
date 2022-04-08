function onlyOne(checkbox) {
    var checkboxes = document.getElementsByName('check')
    checkboxes.forEach((item) => {
        if (item !== checkbox) item.checked = false
    })
}

//<input type="checkbox" name="check" onclick="onlyOne(this)">
// <input type="checkbox" name="check" onclick="onlyOne(this)">
// <input type="checkbox" name="check" onclick="onlyOne(this)">
// <input type="checkbox" name="check" onclick="onlyOne(this)">