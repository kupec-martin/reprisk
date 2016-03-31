SELECT inventory_model_type_create((SELECT id FROM system.client WHERE login_name='root'),'local model');
SELECT inventory_model_type_create((SELECT id FROM system.client WHERE login_name='root'),'group wide model');
