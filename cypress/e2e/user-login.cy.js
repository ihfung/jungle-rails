describe('user-login', () => {
  
  it('Sign up a user', () => {
    cy.visit('/signup');
    cy.get('input[name="user[first_name]"]').type('Sakura');
    cy.get('input[name="user[last_name]"]').type('Haruno');
    cy.get('input[name="user[email]"]').type('sakura@a.ca');
    cy.get('input[name="user[password]"]').type('123456');
    cy.get('input[name="user[password_confirmation]"]').type('123456');
    cy.get('form').click().submit();
    
  });

  it('should login a user', () => {
    cy.visit('/login');
    cy.get('input[name="email"]').type('sakura@a.ca');
    cy.get('input[name="password"]').type('123456');
    cy.get('form').submit();
  }); 
});

  