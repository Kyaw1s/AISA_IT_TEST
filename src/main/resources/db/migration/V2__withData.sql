create table ingredients (
                             id bigint not null,
                             grams_available bigint check (grams_available>=0),
                             name varchar(255),
                             primary key (id)
);

create table recipe_ingredients (
                                    id bigint not null,
                                    quantity_in_grams bigint check (quantity_in_grams>=1),
                                    ingredient_id bigint,
                                    primary key (id)
);

create table recipe_statistics (
                                   id bigint not null,
                                   preparation_number bigint,
                                   recipe_id bigint,
                                   primary key (id)
);

create table recipes (
                         id bigint not null,
                         name varchar(255),
                         primary key (id)
);

create table recipes_ingredients (
                                     recipe_id bigint not null,
                                     ingredients_id bigint not null
);


alter table if exists recipe_statistics
    add constraint recipe_statistics_unique_recipe_id unique (recipe_id);

alter table if exists recipe_ingredients
    add constraint recipe_ingredients_fk_ingredient_id
    foreign key (ingredient_id)
    references ingredients;

alter table if exists recipe_statistics
    add constraint recipe_statistics_fk_recipe_id
    foreign key (recipe_id)
    references recipes;

alter table if exists recipes_ingredients
    add constraint recipes_ingredients_fk_ingredient_id
    foreign key (ingredients_id)
    references recipe_ingredients;

alter table if exists recipes_ingredients
    add constraint recipes_ingredients_fk_recipe_id
    foreign key (recipe_id)
    references recipes;


INSERT INTO ingredients (id, grams_available, name) VALUES (352, 1000, 'robusta');
INSERT INTO ingredients (id, grams_available, name) VALUES (354, 5000, 'arabica');
INSERT INTO ingredients (id, grams_available, name) VALUES (355, 10000, 'water');
INSERT INTO ingredients (id, grams_available, name) VALUES (356, 2000, 'milk');


INSERT INTO recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (102, 10, 352);
INSERT INTO recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (103, 50, 354);
INSERT INTO recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (104, 100, 355);
INSERT INTO recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (105, 10, 352);
INSERT INTO recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (106, 50, 354);
INSERT INTO recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (107, 200, 355);
INSERT INTO recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (108, 10, 352);
INSERT INTO recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (109, 50, 354);
INSERT INTO recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (110, 100, 355);
INSERT INTO recipe_ingredients (id, quantity_in_grams, ingredient_id) VALUES (111, 70, 356);


INSERT INTO recipes (id, name) VALUES (52, 'espresso');
INSERT INTO recipes (id, name) VALUES (53, 'americano');
INSERT INTO recipes (id, name) VALUES (54, 'cappuccino');



INSERT INTO recipe_statistics (id, preparation_number, recipe_id) VALUES (2, 0, 52);
INSERT INTO recipe_statistics (id, preparation_number, recipe_id) VALUES (3, 0, 53);
INSERT INTO recipe_statistics (id, preparation_number, recipe_id) VALUES (4, 0, 54);



INSERT INTO recipes_ingredients (recipe_id, ingredients_id) VALUES (52, 102);
INSERT INTO recipes_ingredients (recipe_id, ingredients_id) VALUES (52, 103);
INSERT INTO recipes_ingredients (recipe_id, ingredients_id) VALUES (52, 104);
INSERT INTO recipes_ingredients (recipe_id, ingredients_id) VALUES (53, 105);
INSERT INTO recipes_ingredients (recipe_id, ingredients_id) VALUES (53, 106);
INSERT INTO recipes_ingredients (recipe_id, ingredients_id) VALUES (53, 107);
INSERT INTO recipes_ingredients (recipe_id, ingredients_id) VALUES (54, 108);
INSERT INTO recipes_ingredients (recipe_id, ingredients_id) VALUES (54, 109);
INSERT INTO recipes_ingredients (recipe_id, ingredients_id) VALUES (54, 110);
INSERT INTO recipes_ingredients (recipe_id, ingredients_id) VALUES (54, 111);