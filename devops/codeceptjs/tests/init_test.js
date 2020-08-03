
Feature('initialize');

let url = "https://www.testsite.com/";
let titleTagSelector = 'title';

Scenario('test something', (I) => {
	I.amOnPage(url);
	I.seeInCurrentUrl("sometext");
	//I.seeElement(titleTagSelector);
});
