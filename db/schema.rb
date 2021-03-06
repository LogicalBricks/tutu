# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130423012841) do

  create_table "lectores", :force => true do |t|
    t.string   "nombre"
    t.string   "primer_apellido"
    t.string   "segundo_apellido"
    t.integer  "grado"
    t.string   "grupo"
    t.date     "fecha_nacimiento"
    t.boolean  "atencion_usaer"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "foto"
    t.string   "codigo"
    t.string   "qr"
  end

  create_table "libros", :force => true do |t|
    t.string   "titulo"
    t.string   "autor"
    t.string   "editorial"
    t.string   "isbn"
    t.integer  "paginas"
    t.text     "descripcion"
    t.integer  "cantidad"
    t.boolean  "reposicion"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "codigo"
    t.boolean  "tipo",        :default => false
    t.string   "qr"
  end

  create_table "prestadores", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "prestamos", :force => true do |t|
    t.integer  "lector_id"
    t.integer  "libro_id"
    t.date     "fecha_prestamo"
    t.date     "fecha_entrega"
    t.boolean  "perdida"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "prestador_id"
  end

  create_table "tests", :force => true do |t|
    t.string   "campo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
