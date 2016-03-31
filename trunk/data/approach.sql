SELECT inventory_approach_create((SELECT id FROM system.client WHERE login_name='root'),'CR','Credit Risk',NULL);
SELECT inventory_approach_create((SELECT id FROM system.client WHERE login_name='root'),'OR','Operational Risk',NULL);
SELECT inventory_approach_create((SELECT id FROM system.client WHERE login_name='root'),'MR','Market Risk',NULL);
SELECT inventory_approach_create((SELECT id FROM system.client WHERE login_name='root'),'IRB','Internal Rating Based Approach',(SELECT id FROM inventory.approach WHERE name='CR'));
SELECT inventory_approach_create((SELECT id FROM system.client WHERE login_name='root'),'IRB-A','Advanced - Internal Rating Based Approach',(SELECT id FROM inventory.approach WHERE name='CR'));
SELECT inventory_approach_create((SELECT id FROM system.client WHERE login_name='root'),'IRB-F','Foundation - Internal Rating Based Approach',(SELECT id FROM inventory.approach WHERE name='CR'));
SELECT inventory_approach_create((SELECT id FROM system.client WHERE login_name='root'),'STA','Standard Approach',(SELECT id FROM inventory.approach WHERE name='CR'));
SELECT inventory_approach_create((SELECT id FROM system.client WHERE login_name='root'),'PPU','Permanent Partial Use',(SELECT id FROM inventory.approach WHERE name='STA'));
SELECT inventory_approach_create((SELECT id FROM system.client WHERE login_name='root'),'TPU','Temporary Partial Use',(SELECT id FROM inventory.approach WHERE name='STA'));
