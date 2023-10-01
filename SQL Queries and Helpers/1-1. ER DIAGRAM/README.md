# ER DIAGRAM

     $table->foreignId('parent_id')->nullable()->constrained('categories')->cascadeOnDelete();

We will need to create a database column called `parent_id`, which is designed to serve as a reference to the parent category within our data structure. When this column contains a `NULL` value, it signifies that this entry is a top-level or main category. On the other hand, if it contains a value greater than zero (`> 0`), it indicates that this entry is a subcategory, and the value of `parent_id` points to the main category to which it belongs, using the foreign key relationship defined with `categories`. Furthermore, if the referenced main category is deleted, this subcategory will also be deleted automatically due to the cascading delete constraint, ensuring data consistency.
Check The ER Diagram:
[ER Diagram
](https://github.com/Medsek233/Buckhill_Technical_Task/blob/main/SQL%20Tasks/ER%20Diagram.jpg)
