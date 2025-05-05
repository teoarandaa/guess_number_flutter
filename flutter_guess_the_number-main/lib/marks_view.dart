class MarksView extends StatelessWidget {
  const MarksView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ViewModel>(context);
    final marks = viewModel.marks;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Scores"),
        backgroundColor: AppColors.primaryColor,
      ),
      body:
          marks.isEmpty
              ? const Center(
                child: Text(
                  "No scores yet! Play some games to see your top scores.",
                ),
              )
              : ListView.builder(
                itemCount: marks.length,
                itemBuilder: (context, index) {
                  final mark = marks[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    elevation: 4,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: Text(
                          "${index + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        "Score: ${mark.score}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        "Date: ${mark.formattedDateTime}",
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
