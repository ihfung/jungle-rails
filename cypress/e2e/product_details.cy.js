describe('product', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  
  it("Click on product to get product details", () => {
    cy.get(".products article").first().click(); //.products is the class of the product list and article is the tag of the product first() is the first product in the list and click() is the action to click on the product
  });

});