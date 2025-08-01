/*class LoginPage extends ConsumerWidget {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: authState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                TextField(controller: emailCtrl, decoration: InputDecoration(labelText: 'Email')),
                TextField(controller: passwordCtrl, decoration: InputDecoration(labelText: 'Password')),
                ElevatedButton(
                  onPressed: () {
                    ref.read(authProvider.notifier).login(
                      emailCtrl.text.trim(),
                      passwordCtrl.text.trim(),
                    );
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
    );
  }
}
*/