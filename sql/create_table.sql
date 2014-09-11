CREATE TABLE payments (
   id       SERIAL,
   dt       TIMESTAMP,
   amount   NUMERIC,
   order_id UUID,
   user_id  INTEGER
);
