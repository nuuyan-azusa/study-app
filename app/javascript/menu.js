const lists = document.getElementById("lists")
const menu = document.getElementById("menu")

menu.addEventListener('click', function(){
  if (lists.getAttribute("style") == "display:block;"){
    lists.removeAttribute("style", "display:block;")
  } else {
  lists.setAttribute("style", "display:block;")
  }
  if (menu.innerHTML == 'menu▽') {
    menu.innerHTML = 'close△';
  } else{
    menu.innerHTML = 'menu▽';
  }
})