describe('sign-up', () => {
  
  it('Sign up a user', () => {
    cy.visit('/signup');
    cy.get('input[name="user[first_name]"]').type('Jenson');
    cy.get('input[name="user[last_name]"]').type('Ackles');
    cy.get('input[name="user[email]"]').type('jenson@a.ca');
    cy.get('input[name="user[password]"]').type('123456');
    cy.get('input[name="user[password_confirmation]"]').type('123456');
    cy.get('form').click().submit();
    cy.visit('/');
    cy.get('a').contains('Logout').click();
  });
});

describe('login', () => {
  it('should login a user', () => {
    cy.visit('/login');
    cy.get('input[name="email"]').type('jenson@a.ca');
    cy.get('input[name="password"]').type('123456');
    cy.get('form').submit();
   
  });
});