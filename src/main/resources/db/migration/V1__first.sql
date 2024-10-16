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