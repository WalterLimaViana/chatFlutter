# Notas

## Firebase :

await Firebase.initializeApp();

### Subir dados no db do firebase:

FirebaseFirestore.instance
.collection("mensagens")
.doc()
.set({'from': 'Carlos', 'text': 'tudo bem também'});

### Ler dados do db do firebase: Para ler todos os documentos utiliza-se o QuerySnapshot

QuerySnapshot snapshot =
await FirebaseFirestore.instance.collection('mensagens').get();
snapshot.docs.forEach((element) {
print(element.data());
element.reference.update({'lido': 'true'});
});

### Para ler somente um documento utiliza-se o DocumentSnapshot

DocumentSnapshot snapshotDocument = await FirebaseFirestore.instance
.collection('mensagens')
.doc('CJahXPcg70IsAln5sGGq')
.get();
print(snapshotDocument.data());

### Atualizar as mudanças de todos os documentos realizadas no DB em tempo real e ser visualizadas no app:

FirebaseFirestore.instance
.collection('mensagens')
.snapshots()
.listen((event) {
event.docs.forEach((element) {
print(element.data());
});
});

### Atualizar as mudanças de um único documento no DB em tempo real e ser visualizadas no app

FirebaseFirestore.instance
.collection('mensagens')
.doc('CJahXPcg70IsAln5sGGq')
.snapshots()
.listen((event) {
print(event.data());
});
