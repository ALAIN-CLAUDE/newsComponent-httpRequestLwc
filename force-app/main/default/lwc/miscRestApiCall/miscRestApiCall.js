import { LightningElement } from 'lwc';

export default class MiscRestApiCall extends LightningElement {
  selection;

  handleChangeboxChange(){
    //query the dom
    const checked = Array.from(
      this.template.querySelectorAll("lightning-input")
    )

    //filter to only checked items
    .filter(element => element.label);
    //map to their label

    .map(el=> el.label);
    this.selection = checked.join(',');
  }
}