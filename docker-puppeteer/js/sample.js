const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('https://www.library.city.sapporo.jp/licsxp-opac/WOpacMnuTopInitAction.do?WebLinkFlag=1&moveToGamenId=mylibrary');
  await page.screenshot({path: 'example.png'});

  await browser.close();
})();
