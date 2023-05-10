let counter=0;
const catbtn= document.querySelector("#addCategory")
const userbtn=document.querySelector(".user_cat")

nestedFOrm=document.querySelector(".nested_form")

catbtn.addEventListener("click", addCategory)

function addCategory(event){
    event.preventDefault()
    console.log("cdasd")
    if (counter<2){
        const userid=document.querySelector("#user_id").value
        console.log("cdasd")
    const div= document.createElement("DIV")
     div.innerHTML= `<input type="hidden" value="${userid}" name="product[categories][${counter}][user_id]"
                     id="product[categories][user_id]"> 
                    <input type="text" placeholder="Enter Categories" 
                    name="product[categories][${counter}][name]"
                    id="product_categories_${counter}_name">`
    //  const name=document.createElement("DIV")
    //  name.innerHTML=`<input type="text" name="product[categories][user_id]"
    //  id="product[categories][user_id]">`
     nestedFOrm.append(div)
    //  nestedFOrm.append(name)
     console.log(userbtn.value)
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