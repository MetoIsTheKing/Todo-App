import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/home%20feature/services/note_model.dart';

class NoteRepository {
  final SupabaseClient client;

  NoteRepository( this.client);

  Future<List<Note>> fetchNotes() async {
    try {
      final response = await client
          .from('notes')
          .select()
          .order('priority', ascending: true);

      // Ensure response is a list of maps
      final data = response as List<dynamic>;
      return data.map((note) => Note.fromJson(note as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Error fetching notes: $e');
    }
  }

  Future<void> addNote({
  required String content,
  required String category,
  required int priority,
  required String color,
}) async {
    final response = await client.from('notes').insert({
      'content': content,
      'category': category,
      'priority': priority,
      'color': color,
      'completed': false,
    });
    if (kDebugMode) {
      print('Response from Supabase: $response');
    }
}

  Future<void> updateNoteStatus(int id, bool updates) async {
    try {
      await client.from('notes').update({'completed':updates}).eq('id', id);
    } catch (e) {
      throw Exception('Error updating note: $e');
    }
  }

  Future<void> deleteNote(int id) async {
    try {
      await client.from('notes').delete().eq('id', id);
    } catch (e) {
      throw Exception('Error deleting note: $e');
    }
  }

  Future<void> updateNote(int id, Map<String, dynamic> updates) async {
    try {
      await client.from('notes').update(updates).eq('id', id);
    } catch (e) {
      throw Exception('Error updating note: $e');
    }
  }


}
