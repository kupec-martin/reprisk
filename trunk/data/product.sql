SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Products','Products','Product Categories',NULL);
	SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Cars & Motorcycles','CM','Cars & Motorcycles',(SELECT id FROM inventory.product WHERE acronym='Products'));
		SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Sport Cars','SC','Sport Cars',(SELECT id FROM inventory.product WHERE acronym='CM'));
		SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Trucks','TR','Trucks',(SELECT id FROM inventory.product WHERE acronym='CM'));
		SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Racing Motorcycles','RM','Racing Motorcycles',(SELECT id FROM inventory.product WHERE acronym='CM'));
	SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Beauty & Health','BH','Beauty & Healt',(SELECT id FROM inventory.product WHERE acronym='Products'));
		SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Hygiene Articles','HA','Hygiene Articles',(SELECT id FROM inventory.product WHERE acronym='BH'));
		SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Beauty Products','BP','Beauty Products',(SELECT id FROM inventory.product WHERE acronym='BH'));
	SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Books & Periodicals','BO','Books & Periodicals',(SELECT id FROM inventory.product WHERE acronym='Products'));
				SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Magazines','MG','Magazines',(SELECT id FROM inventory.product WHERE acronym='BO'));
				SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Science','SB','Scientific literature',(SELECT id FROM inventory.product WHERE acronym='BO'));
					SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Mathematics','MM','Mathematics literature',(SELECT id FROM inventory.product WHERE acronym='SB'));
					SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Physics','PH','Physics literature',(SELECT id FROM inventory.product WHERE acronym='SB'));
	SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Music','MU','Music',(SELECT id FROM inventory.product WHERE acronym='Products'));
		SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Classic','CS','Classic Music',(SELECT id FROM inventory.product WHERE acronym='MU'));
		SELECT inventory_product_create((SELECT id FROM system.client WHERE login_name='root'),'Pop','PM','Pop Music',(SELECT id FROM inventory.product WHERE acronym='MU'));

