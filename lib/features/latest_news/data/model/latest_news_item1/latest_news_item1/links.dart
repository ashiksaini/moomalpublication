import 'about.dart';
import 'author.dart';
import 'collection.dart';
import 'cury.dart';
import 'predecessor_version.dart';
import 'reply.dart';
import 'self.dart';
import 'version_history.dart';
import 'wp_attachment.dart';
import 'wp_featuredmedia.dart';
import 'wp_term.dart';

class Links {
  List<Self>? self;
  List<Collection>? collection;
  List<About>? about;
  List<Author>? author;
  List<Reply>? replies;
  List<VersionHistory>? versionHistory;
  List<PredecessorVersion>? predecessorVersion;
  List<WpFeaturedmedia>? wpFeaturedmedia;
  List<WpAttachment>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Cury>? curies;

  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.predecessorVersion,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: (json['self'] as List<dynamic>?)
            ?.map((e) => Self.fromJson(e as Map<String, dynamic>))
            .toList(),
        collection: (json['collection'] as List<dynamic>?)
            ?.map((e) => Collection.fromJson(e as Map<String, dynamic>))
            .toList(),
        about: (json['about'] as List<dynamic>?)
            ?.map((e) => About.fromJson(e as Map<String, dynamic>))
            .toList(),
        author: (json['author'] as List<dynamic>?)
            ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
            .toList(),
        replies: (json['replies'] as List<dynamic>?)
            ?.map((e) => Reply.fromJson(e as Map<String, dynamic>))
            .toList(),
        versionHistory: (json['version-history'] as List<dynamic>?)
            ?.map((e) => VersionHistory.fromJson(e as Map<String, dynamic>))
            .toList(),
        predecessorVersion: (json['predecessor-version'] as List<dynamic>?)
            ?.map((e) => PredecessorVersion.fromJson(e as Map<String, dynamic>))
            .toList(),
        wpFeaturedmedia: (json['wp:featuredmedia'] as List<dynamic>?)
            ?.map((e) => WpFeaturedmedia.fromJson(e as Map<String, dynamic>))
            .toList(),
        wpAttachment: (json['wp:attachment'] as List<dynamic>?)
            ?.map((e) => WpAttachment.fromJson(e as Map<String, dynamic>))
            .toList(),
        wpTerm: (json['wp:term'] as List<dynamic>?)
            ?.map((e) => WpTerm.fromJson(e as Map<String, dynamic>))
            .toList(),
        curies: (json['curies'] as List<dynamic>?)
            ?.map((e) => Cury.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'self': self?.map((e) => e.toJson()).toList(),
        'collection': collection?.map((e) => e.toJson()).toList(),
        'about': about?.map((e) => e.toJson()).toList(),
        'author': author?.map((e) => e.toJson()).toList(),
        'replies': replies?.map((e) => e.toJson()).toList(),
        'version-history': versionHistory?.map((e) => e.toJson()).toList(),
        'predecessor-version':
            predecessorVersion?.map((e) => e.toJson()).toList(),
        'wp:featuredmedia': wpFeaturedmedia?.map((e) => e.toJson()).toList(),
        'wp:attachment': wpAttachment?.map((e) => e.toJson()).toList(),
        'wp:term': wpTerm?.map((e) => e.toJson()).toList(),
        'curies': curies?.map((e) => e.toJson()).toList(),
      };
}
