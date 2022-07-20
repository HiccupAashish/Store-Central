let counter=0;
const catbtn= document.querySelector("#addCategory")

nestedFOrm=document.querySelector(".nested_form")

catbtn.addEventListener("click", addCategory)

function addCategory(event){
    event.preventDefault()
    if (counter<2){
    const div= document.createElement("DIV")
     div.innerHTML= `<input type="text" placeholder="Enter Categories" 
     name="product[categories][${counter}][name]"
     id="product_categories_${counter}_name">`
     nestedFOrm.append(div)
     counter++
    } else{
     nestedFOrm.append("Sorry cannt anymore Categories for one Product")
    }
}
// btn=document.querySelector(".close")
// btn.addEventListener("click", close_tab)
// function close_tab(event){
//     event.preventDefault
//     console.log("hi")
// }