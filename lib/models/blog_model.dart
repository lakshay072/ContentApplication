class FirstBlog {
  String? object;
  String? id;
  Parent? parent;
  String? createdTime;
  String? lastEditedTime;
  CreatedBy? createdBy;
  CreatedBy? lastEditedBy;
  bool? hasChildren;
  bool? archived;
  String? type;
  Paragraph? paragraph;

  FirstBlog({
    this.object,
    this.id,
    this.parent,
    this.createdTime,
    this.lastEditedTime,
    this.createdBy,
    this.lastEditedBy,
    this.hasChildren,
    this.archived,
    this.type,
    this.paragraph,
  });

  FirstBlog.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    id = json['id'];
    parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    createdTime = json['created_time'];
    lastEditedTime = json['last_edited_time'];
    createdBy = json['created_by'] != null
        ? CreatedBy.fromJson(json['created_by'])
        : null;
    lastEditedBy = json['last_edited_by'] != null
        ? CreatedBy.fromJson(json['last_edited_by'])
        : null;
    hasChildren = json['has_children'];
    archived = json['archived'];
    type = json['type'];
    paragraph = json['paragraph'] != null
        ? Paragraph.fromJson(json['paragraph'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['object'] = object;
    data['id'] = id;
    if (parent != null) {
      data['parent'] = parent!.toJson();
    }
    data['created_time'] = createdTime;
    data['last_edited_time'] = lastEditedTime;
    if (createdBy != null) {
      data['created_by'] = createdBy!.toJson();
    }
    if (lastEditedBy != null) {
      data['last_edited_by'] = lastEditedBy!.toJson();
    }
    data['has_children'] = hasChildren;
    data['archived'] = archived;
    data['type'] = type;
    if (paragraph != null) {
      data['paragraph'] = paragraph!.toJson();
    }
    return data;
  }
}

class Parent {
  String? type;
  String? pageId;

  Parent({this.type, this.pageId});

  Parent.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    pageId = json['page_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = type;
    data['page_id'] = pageId;
    return data;
  }
}

class CreatedBy {
  String? object;
  String? id;

  CreatedBy({this.object, this.id});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['object'] = object;
    data['id'] = id;
    return data;
  }
}

class Paragraph {
  List<dynamic>? richText;
  String? color;

  Paragraph({this.richText, this.color});

  Paragraph.fromJson(Map<String, dynamic> json) {
    richText = json['rich_text'] != null ? List.from(json['rich_text']) : null;
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (richText != null) {
      data['rich_text'] = richText;
    }
    data['color'] = color;
    return data;
  }
}
