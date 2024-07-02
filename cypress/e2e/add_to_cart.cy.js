describe('home', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  
  it("click add cart button for one of the product and confirm the product is added to the cart", () => {
    cy.get(".btn").first().click(); //btn class in the html file and click the first button
    cy.get(".nav-item").contains("(1)"); //nav-item class in the html file and see if it contains value 1
  });
});