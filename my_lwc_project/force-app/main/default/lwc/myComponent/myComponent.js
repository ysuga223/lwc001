import { LightningElement, wire, track } from 'lwc';
import getApiData from '@salesforce/apex/MyClass.getApiData';

export default class MyComponent extends LightningElement {
    @track data;

    handleClick() {
        getApiData()
            .then(result => {
                this.data = result;
            })
            .catch(error => {
                console.error('Error in fetching data', error);
            });
    }
}
