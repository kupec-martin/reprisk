-- create standard clients
SELECT system_client_create_view( 1, 'Martin', 'Kupec', 'martin', md5('x'), 'en', 365, false, 0, 'martin.kupec@gmail.com');
SELECT assignment_inventory_company_create_view( 1,'BA', 'martin', 'editor', 'global', 'inventory', 'company');