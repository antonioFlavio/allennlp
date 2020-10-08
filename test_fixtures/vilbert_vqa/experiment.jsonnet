local model_name = "bert-base-uncased";
{
  "dataset_reader": {
    "type": "vqav2",
    "image_dir": "/net/nfs2.corp/prior/datasets/coco",
    "feature_cache_dir": "test_fixtures/data/vqav2/images/experiment_cache",
    "image_loader": "detectron",
    "image_featurizer": "null",
    "region_detector": "null",
    "tokenizer": {
      "type": "pretrained_transformer",
      "model_name": model_name
    },
    "token_indexers": {
      "tokens": {
        "type": "pretrained_transformer",
        "model_name": model_name
      }
    }
  },
  "train_data_path": "balanced_real_train",
  "validation_data_path": "balanced_real_val",
  "vocabulary": {"type": "empty"},
  "model": {
    "type": "vqa_vilbert",
    "text_embeddings": {
      "vocab_size": 30522,
      "hidden_size": 22,
      "pad_token_id": 0,
      "max_position_embeddings": 50,
      "type_vocab_size": 4,
      "dropout": 0.0
    },
    "image_embeddings": {
      "feature_dim": 2048,
      "hidden_dim": 28
    },
    "encoder": {
      "text_num_hidden_layers": 12,
      "image_num_hidden_layers": 6,
      "text_hidden_size": 768,
      "image_hidden_size": 1024,
      "combined_hidden_size": 1024,
      "text_intermediate_size": 3072,
      "image_intermediate_size": 1024,
      "text_num_attention_heads": 12,
      "text_attention_dropout": 0.1,
      "image_attention_dropout": 0.1,
      "text_hidden_dropout": 0.1,
      "image_hidden_dropout": 0.1,
      "activation": "gelu",
      "v_biattention_id": [0, 1, 2, 3, 4, 5],
      "t_biattention_id": [6,7,8,9,10,11],
      "fixed_t_layer": 0,
      "fixed_v_layer": 0
    },
    "pooled_output_dim": 1024,
    "fusion_method": "sum"
  },
  "data_loader": {
    "batch_size": 32
  },
  "trainer": {
    "optimizer": {
      "type": "huggingface_adamw",
      "lr": 0.00005
    },
    "num_epochs": 1,
  },
  "distributed": {
    "cuda_devices": [0, 1]
  }
}