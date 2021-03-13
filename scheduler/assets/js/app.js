// credit to Nat Tuck's lecture notes https://github.com/NatTuck/scratch-2021-01/blob/master/notes-4550/10-multi/notes.md
import jQuery from 'jquery';
window.jQuery = window.$ = jQuery;
import "bootstrap";

// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
//import "phoenix_html"



// The structure below comes from the following guide:
// https://medium.com/@chipdean/phoenix-array-input-field-implementation-7ec0fe0949d

// I used this guide for help implementing list operations

// The code below links all remove/add buttons for lists   
window.onload = () => {
  const removeElement = ({target}) => {
    let el = document.getElementById(target.dataset.id);
    let li = el.parentNode;
    li.parentNode.removeChild(li);
  }
  Array.from(document.querySelectorAll(".removelistitem"))
  .forEach(el => {
     el.onclick = (e) => {
       removeElement(e);
     }
  });
  Array.from(document.querySelectorAll(".addlistitem"))
  .forEach(el => {
    el.onclick = ({target: {dataset}}) => {
      let container = document.getElementById(dataset.container);
      let index = container.dataset.index;
      let newRow = dataset.prototype;
      container.insertAdjacentHTML("beforeend",       newRow.replace(/__name__/g, index));
      container.dataset.index = parseInt(container.dataset.index) + 1;
      container.querySelector("a.removelistitem").onclick = (e) => {
        removeElement(e);
      }
    }
  });
}