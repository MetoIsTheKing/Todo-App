import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/app.dart';
void main() async{
  await Supabase.initialize(
    url: 'https://hisdccraqvdruujjarpg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhpc2RjY3JhcXZkcnV1amphcnBnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM3NDQzMjQsImV4cCI6MjA0OTMyMDMyNH0.JulpNx8QCvwcV-lLawoHrKsZExJYXstAcwG9qmUcOVE',
  );
  runApp(const TodoApp());
  }