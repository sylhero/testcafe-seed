import { Selector } from 'testcafe';
import helper from '../common/helper';

const test = 'a';

fixture `Login`
    .page `${helper.baseUrl}`;

test('My first test', async (t) => {
    const loginButton = Selector('button').withAttribute('type', 'submit');
    const menuAccount = Selector('#menu_account');
    await t
        .typeText('#username', helper.username)
        .typeText('#password', helper.password)
        .click(loginButton)
        .expect(menuAccount.exists).ok();
});
