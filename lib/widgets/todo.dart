import 'package:flutter/material.dart';
import 'glassmorphic_card.dart';
import 'app_text_styles.dart';

class TodoItem {
  String text;
  bool isDone;
  
  TodoItem({required this.text, this.isDone = false});
}

class TodoWidget extends StatefulWidget {
  final double width;
  
  const TodoWidget({
    super.key,
    required this.width,
  });

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  final List<TodoItem> _todos = [];
  final TextEditingController _controller = TextEditingController();
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  void _addTodo() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _todos.add(TodoItem(text: _controller.text.trim()));
        _controller.clear();
      });
    }
  }
  
  void _toggleTodo(int index) {
    setState(() {
      _todos[index].isDone = !_todos[index].isDone;
    });
  }
  
  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      width: widget.width,
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Tasks',
              style: AppTextStyles.subHeading,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: AppTextStyles.body,
                    decoration: InputDecoration(
                      hintText: 'Add a new task...',
                      hintStyle: AppTextStyles.body.copyWith(color: Colors.white38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white.withAlpha(50)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white.withAlpha(50)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF6A1B9A)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: _addTodo,
                  icon: const Icon(Icons.add_circle, color: Color(0xFF6A1B9A), size: 36),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _todos.isEmpty
                  ? Center(
                      child: Text(
                        'No tasks yet. Add one!',
                        style: AppTextStyles.body,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _todos.length,
                      itemBuilder: (context, index) {
                        final todo = _todos[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withAlpha(20),
                            ),
                            child: ListTile(
                              leading: IconButton(
                                icon: Icon(
                                  todo.isDone ? Icons.check_circle : Icons.circle_outlined,
                                  color: todo.isDone ? const Color(0xFF6A1B9A) : Colors.white70,
                                ),
                                onPressed: () => _toggleTodo(index),
                              ),
                              title: Text(
                                todo.text,
                                style: AppTextStyles.body.copyWith(
                                  decoration: todo.isDone ? TextDecoration.lineThrough : null,
                                  color: todo.isDone ? Colors.white38 : Colors.white,
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.white70),
                                onPressed: () => _deleteTodo(index),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}