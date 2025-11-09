import '../../../models/npc.dart';
import '../../../models/dialogue_tree.dart';

/// NPCs for Crystalport (Second major town in Chapter 2)
class CrystalportNPCs {
  /// Create the head librarian
  static NPC createHeadLibrarian() {
    return NPC(
      id: 'crystalport_librarian',
      name: 'Librarian Thaddeus',
      description: 'The knowledgeable head librarian of the Grand Library',
      dialogue: _createLibrarianDialogue(),
      location: 'Crystalport Grand Library',
    );
  }

  static DialogueTree _createLibrarianDialogue() {
    return DialogueTree(
      id: 'crystalport_librarian_dialogue',
      name: 'Librarian Thaddeus',
      startNodeId: 'greeting',
      nodes: {
        'greeting': DialogueTreeNode(
          id: 'greeting',
          text: 'Welcome to the Grand Library. How may I assist your research?',
          speaker: 'Librarian Thaddeus',
          choices: [
            DialogueTreeChoice(
              id: 'lighthouses',
              text: 'We\'re researching the ancient lighthouses.',
              nextNodeId: 'lighthouses_info',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'missing_text',
              text: 'Looking for information on a missing text.',
              nextNodeId: 'missing',
              tone: ChoiceTone.curious,
            ),
          ],
        ),
        'lighthouses_info': DialogueTreeNode(
          id: 'lighthouses_info',
          text: 'Ah, the Elemental Lighthouses. We have extensive records in the Ancient History section.',
          speaker: 'Librarian Thaddeus',
        ),
        'missing': DialogueTreeNode(
          id: 'missing',
          text: 'Yes, we\'ve been missing a valuable tome. If you find it, please return it to us.',
          speaker: 'Librarian Thaddeus',
        ),
      },
    );
  }

  /// Create a dockworker
  static NPC createDockworker() {
    return NPC(
      id: 'crystalport_dockworker',
      name: 'Dockworker Cole',
      description: 'A hardworking dockhand who hears all the port gossip',
      dialogue: _createDockworkerDialogue(),
      location: 'Crystalport Docks',
    );
  }

  static DialogueTree _createDockworkerDialogue() {
    return DialogueTree(
      id: 'crystalport_dockworker_dialogue',
      name: 'Dockworker Cole',
      startNodeId: 'busy',
      nodes: {
        'busy': DialogueTreeNode(
          id: 'busy',
          text: 'Can\'t talk long - got cargo to move. What do you need?',
          speaker: 'Dockworker Cole',
          choices: [
            DialogueTreeChoice(
              id: 'ask_ships',
              text: 'Seen any unusual ships lately?',
              nextNodeId: 'ships',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'ask_gossip',
              text: 'Any interesting news from the port?',
              nextNodeId: 'gossip',
              tone: ChoiceTone.curious,
            ),
          ],
        ),
        'ships': DialogueTreeNode(
          id: 'ships',
          text: 'A few military vessels. They don\'t talk to us common folk much.',
          speaker: 'Dockworker Cole',
        ),
        'gossip': DialogueTreeNode(
          id: 'gossip',
          text: 'Sailors talk about strange lights near the old Mercury ruins. Give me the creeps.',
          speaker: 'Dockworker Cole',
        ),
      },
    );
  }

  /// Create the bookstore owner
  static NPC createBookstoreOwner() {
    return NPC(
      id: 'crystalport_bookstore_owner',
      name: 'Silas',
      description: 'The eccentric owner of the Old Bookstore',
      dialogue: _createBookstoreOwnerDialogue(),
      location: 'Old Bookstore',
    );
  }

  static DialogueTree _createBookstoreOwnerDialogue() {
    return DialogueTree(
      id: 'crystalport_bookstore_dialogue',
      name: 'Silas the Bookseller',
      startNodeId: 'greeting',
      nodes: {
        'greeting': DialogueTreeNode(
          id: 'greeting',
          text: 'Ah, fellow book lovers! Browse to your heart\'s content.',
          speaker: 'Silas',
          choices: [
            DialogueTreeChoice(
              id: 'ancient_text',
              text: 'Looking for an ancient text about lighthouses.',
              nextNodeId: 'has_it',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'browse',
              text: 'Just browsing, thank you.',
              nextNodeId: 'browse_response',
              tone: ChoiceTone.diplomatic,
            ),
          ],
        ),
        'has_it': DialogueTreeNode(
          id: 'has_it',
          text: 'Funny you should ask... I may have acquired such a tome recently. For the right price, of course.',
          speaker: 'Silas',
        ),
        'browse_response': DialogueTreeNode(
          id: 'browse_response',
          text: 'Take your time. Many treasures hide on these shelves.',
          speaker: 'Silas',
        ),
      },
    );
  }

  /// Create a ship captain
  static NPC createShipCaptain() {
    return NPC(
      id: 'crystalport_captain',
      name: 'Captain Marina',
      description: 'A seasoned sea captain with tales to tell',
      dialogue: _createCaptainDialogue(),
      location: 'Crystalport Harbor',
    );
  }

  static DialogueTree _createCaptainDialogue() {
    return DialogueTree(
      id: 'crystalport_captain_dialogue',
      name: 'Captain Marina',
      startNodeId: 'salty_greeting',
      nodes: {
        'salty_greeting': DialogueTreeNode(
          id: 'salty_greeting',
          text: 'Ahoy there! You have the look of adventurers about you.',
          speaker: 'Captain Marina',
          choices: [
            DialogueTreeChoice(
              id: 'ask_travels',
              text: 'Where do your travels take you?',
              nextNodeId: 'travels',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'ask_dangers',
              text: 'Any dangers on the seas?',
              nextNodeId: 'dangers',
              tone: ChoiceTone.pragmatic,
            ),
          ],
        ),
        'travels': DialogueTreeNode(
          id: 'travels',
          text: 'All along the coast. Seen many strange things lately - weather\'s been odd.',
          speaker: 'Captain Marina',
        ),
        'dangers': DialogueTreeNode(
          id: 'dangers',
          text: 'Pirates, storms, and worse. Some say the old Mercury Lighthouse is cursed.',
          speaker: 'Captain Marina',
        ),
      },
    );
  }

  /// Create a town crier
  static NPC createTownCrier() {
    return NPC(
      id: 'crystalport_crier',
      name: 'Town Crier',
      description: 'The loud voice keeping citizens informed',
      dialogue: _createCrierDialogue(),
      location: 'Crystalport Square',
    );
  }

  static DialogueTree _createCrierDialogue() {
    return DialogueTree(
      id: 'crystalport_crier_dialogue',
      name: 'Town Crier',
      startNodeId: 'proclamation',
      nodes: {
        'proclamation': DialogueTreeNode(
          id: 'proclamation',
          text: 'Hear ye! The Council announces new trade routes opening soon!',
          speaker: 'Town Crier',
          choices: [
            DialogueTreeChoice(
              id: 'ask_council',
              text: 'What council is this?',
              nextNodeId: 'council_info',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'ask_news',
              text: 'Any other news?',
              nextNodeId: 'other_news',
              tone: ChoiceTone.curious,
            ),
          ],
        ),
        'council_info': DialogueTreeNode(
          id: 'council_info',
          text: 'The Adept Council, of course! They oversee the great lighthouse project.',
          speaker: 'Town Crier',
        ),
        'other_news': DialogueTreeNode(
          id: 'other_news',
          text: 'Recruitment continues for lighthouse construction! Good pay for brave workers!',
          speaker: 'Town Crier',
        ),
      },
    );
  }

  /// Get all Crystalport NPCs
  static List<NPC> getAllNPCs() {
    return [
      createHeadLibrarian(),
      createDockworker(),
      createBookstoreOwner(),
      createShipCaptain(),
      createTownCrier(),
    ];
  }
}
