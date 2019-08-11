describe('Detox UI Test', () => {
  beforeEach(async () => {
    await device.reloadReactNative();
  });

  it('Whole UI test', async () => {
    await expect(element(by.id('navDrawerOpen'))).toBeVisible();
    await element(by.id('navDrawerOpen')).tap();
    await expect(element(by.text('LookAndFeel'))).toBeVisible();
    await element(by.text('LookAndFeel')).tap();
    await element(by.id('textField')).typeText('UI Test works!');
    await expect(element(by.id('textField'))).toHaveText('UI Test works!');
  });
});
